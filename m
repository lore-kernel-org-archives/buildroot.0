From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 22:22:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/intel-mediadriver: disable
 -Werror
In-Reply-To: <20210605151509.406358-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 5 Jun 2021 17:15:09 +0200")
References: <20210605151509.406358-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1h9h3ln.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable -Werror to avoid the following build failure:
 > <command-line>: error: "_FORTIFY_SOURCE" redefined [-Werror]

 > MEDIA_BUILD_FATAL_WARNINGS option is available since version 18.2.0 and
 > https://github.com/intel/media-driver/commit/6932fc0ffb8228245052528820adafb6743f7482

 > Fixes:
 >  - http://autobuild.buildroot.org/results/52638d95312e464626d1c4047b3b26d4f57a1cd2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
