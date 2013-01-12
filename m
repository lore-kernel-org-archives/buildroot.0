From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Jan 2013 22:50:24 +0100
Subject: [Buildroot] [PATCH 22/28] metacity: fix X.org dependencies
In-Reply-To: <c5bc9e78b820037000023382ff4cd79758dbc501.1357507764.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Jan 2013 22:29:34 +0100")
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <c5bc9e78b820037000023382ff4cd79758dbc501.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87sj66136n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Metacity is a X client application, so there is no reason to depend on
 Thomas> the X.org server. Instead, depend on the appropriate X libraries.

 Thomas> In addition to the X.org related dependencies, we also add the
 Thomas> host-libxml-parser-perl dependency, otherwise:

 Thomas>   checking for XML::Parser... configure: error: XML::Parser perl module is required for intltool
 Thomas>   make[1]: *** [/home/test/outputs/xorg/build/metacity-2.25.1/.stamp_configured] Error 1
 Thomas>   make: *** [all] Error 2

Committed, thanks.

-- 
Bye, Peter Korsgaard
