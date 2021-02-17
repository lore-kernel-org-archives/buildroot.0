From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 11:21:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/orc: fix powerpc build with
 headers < 4.11
In-Reply-To: <20210215192756.1145129-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 15 Feb 2021 20:27:56 +0100")
References: <20210215192756.1145129-1-fontaine.fabrice@gmail.com>
Message-ID: <87tuqb3sgf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Autobuilder failures are raised with bootlin toolchains but it affects
 > orc since version 0.4.30

 > Fixes:
 >  - http://autobuild.buildroot.org/results/0821e96cba3e455edd47b87485501d892fc7ac6a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
