From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Jun 2014 13:56:04 +0200
Subject: [Buildroot] [PATCH] vlc: security bump to version 2.1.4
In-Reply-To: <1403034206-17578-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 17 Jun 2014 16:43:26 -0300")
References: <1403034206-17578-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d2e677or.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes CVE-2014-1684: The ASF_ReadObject_file_properties function in
 > modules/demux/asf/libasf.c in the ASF Demuxer in VideoLAN VLC Media
 > Player before 2.1.3 allows remote attackers to cause a denial of service
 > (divide-by-zero error and crash) via a zero minimum and maximum data
 > packet size in an ASF file.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
