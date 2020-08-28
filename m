From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:44:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/json-c: security bump to
 version 0.15
In-Reply-To: <20200827172644.140369-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 27 Aug 2020 19:26:44 +0200")
References: <20200827172644.140369-1-fontaine.fabrice@gmail.com>
Message-ID: <87k0xioeb9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2020-12762: json-c through 0.14 has an integer overflow and
 > out-of-bounds write via a large JSON file, as demonstrated by
 > printbuf_memappend.

 > Also update indentation in hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
