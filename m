From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 15:37:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpcap: fix
 bluez5_utils-headers dependency
In-Reply-To: <20190318224042.4568-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 18 Mar 2019 23:40:42 +0100")
References: <20190318224042.4568-1-fontaine.fabrice@gmail.com>
Message-ID: <87imw4s7r3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit c46afc37dc877f1e94ffde0d77585290711b27ec changed bluez5-utils
 > dependency by bluez5_utils-headers without replacing the test on
 > BR2_PACKAGE_BLUEZ5_UTILS by BR2_PACKAGE_BLUEZ5_UTILS_HEADERS

 > Fix this mistake and also add a select on
 > BR2_PACKAGE_BLUEZ5_UTILS_HEADERS if BR2_PACKAGE_BLUEZ5_UTILS is set
 > so the user does not have to do it

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c6828df1f3782564451ddd4187ff026679bf37d8

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
