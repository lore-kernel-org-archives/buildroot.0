From: Hebbar <gururajakr@sanyo.co.in>
Date: Fri, 15 Feb 2008 20:56:34 -0800 (PST)
Subject: [Buildroot]  Add SDL_mixer to buildroot/package
Message-ID: <15514999.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

Below is a patch to add sdl_mixer package to buildroot. I have tested it for
arm926ejs toolchain with buildroot 4th feb Snapshot.

Kindly add it to buildroot trunk.

Regards
Gururaja


add SDL_Mixer package 

Added: 
   buildroot/package/sdl_mixer/ 
   buildroot/package/sdl_mixer/Config.in 
   buildroot/package/sdl_mixer/sdl_mixer.mk
   buildroot/package/sdl_mixer/sdl_mixer-1.2.8_sdl_header.patch

Modified: 
   buildroot/package/Config.in 
http://www.nabble.com/file/p15514999/package_config_in.patch
package_config_in.patch 

http://www.nabble.com/file/p15514999/sdl_mixer-1.2.8_sdl_header.patch
sdl_mixer-1.2.8_sdl_header.patch 
http://www.nabble.com/file/p15514999/sdl_mixer.patch sdl_mixer.patch 
-- 
View this message in context: http://www.nabble.com/Add-SDL_mixer-to-buildroot-package-tp15514999p15514999.html
Sent from the BuildRoot mailing list archive at Nabble.com.
