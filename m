From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:46:38 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/neon: add NLS dependencies
In-Reply-To: <20190422091651.29540-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 22 Apr 2019 11:16:51 +0200")
References: <20190422091651.29540-1-fontaine.fabrice@gmail.com>
Message-ID: <87k1fhylw1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > neon checks for bind_textdomain_codeset
 > Helps neon to find lintl so it will correctly add -lintl to neon-config
 > en neon.pc. This will fix build of packages using neon such as nu

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f7e6afce4b3335573f3cc62d282368b288e9a65a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Help neon finding TARGET_NLS_LIBS

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
