From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Jun 2021 22:56:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpv: security bump to version
 0.33.1
In-Reply-To: <20210527070423.720341-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 27 May 2021 09:04:23 +0200")
References: <20210527070423.720341-1-fontaine.fabrice@gmail.com>
Message-ID: <87wnr2n4dx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-30145: A format string vulnerability in mpv through 0.33.0
 > allows user-assisted remote attackers to achieve code execution via a
 > crafted m3u playlist file.

 > https://github.com/mpv-player/mpv/releases/tag/v0.33.1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
