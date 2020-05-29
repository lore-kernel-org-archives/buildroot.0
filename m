From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 May 2020 23:30:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/libexif: security bump to
 version 0.6.22
In-Reply-To: <20200518163137.2943554-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 18 May 2020 18:31:37 +0200")
References: <20200518163137.2943554-1-fontaine.fabrice@gmail.com>
Message-ID: <87tuzyl99c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Switch site to github
 > - Drop patches (already in version)
 > - Fix the following CVEs:
 >   - CVE-2020-13114: Time consumption DoS when parsing canon array
 >     markers
 >   - CVE-2020-13113: Potential use of uninitialized memory
 >   - CVE-2020-13112: Various buffer overread fixes due to integer
 >     overflows in maker notes
 >   - CVE-2020-0093: read overflow
 >   - CVE-2020-12767: fixed division by zero

 > https://github.com/libexif/libexif/releases/tag/libexif-0_6_22-release

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
