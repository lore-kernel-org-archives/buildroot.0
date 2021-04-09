From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Apr 2021 22:55:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 4.4
In-Reply-To: <20210409202022.2183773-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 9 Apr 2021 22:20:22 +0200")
References: <20210409202022.2183773-1-bernd.kuhls@t-online.de>
Message-ID: <87o8en6uv3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Remove wavpack-related patch and configure options due to upstream
 > removal of wavpack support:
 > http://git.videolan.org/?p=ffmpeg.git;a=commit;h=45070eec4c089b06947f07e25cdb1bc8b2102553

 > Changelog:
 > http://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;;hb=refs/heads/release/4.4

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

I see there are a bunch of fixes upstream in the 4.3 branch
post-4.3.2. Do you know if there are plans for a 4.3.3 release for our
LTS?

-- 
Bye, Peter Korsgaard
