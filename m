From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Apr 2020 09:04:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/freerdp: security bump to
 version 2.0.0
In-Reply-To: <20200410184059.5302-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 10 Apr 2020 20:40:59 +0200")
References: <20200410184059.5302-1-fontaine.fabrice@gmail.com>
Message-ID: <87h7x8ujuf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > From the ChangeLog:
 > - Fix multiple CVEs: CVE-2020-11521 CVE-2020-11522 CVE-2020-11523
 >   CVE-2020-11524 CVE-2020-11525 CVE-2020-11526
 > - Fix multiple other security related issues (#6005, #6006, #6007,
 >   #6008, #6009, #6010, #6011, #6012, #6013)

 > - Retrieve official tarball
 > - Drop patch (already in version)
 > - libusb is needed for urbdrc channel since
 >   https://github.com/FreeRDP/FreeRDP/commit/0927d7aa50c76b671b55c33e0f06c950d1f08e9a
 > - Add a patch to fix build on uclibc
 > - Update indentation in hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
