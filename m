From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 19:21:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcgroup: fix CVE-2018-14348
In-Reply-To: <20200229223018.4032175-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Feb 2020 23:30:18 +0100")
References: <20200229223018.4032175-1-fontaine.fabrice@gmail.com>
Message-ID: <87a74isspg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libcgroup up to and including 0.41 creates /var/log/cgred with mode 0666
 > regardless of the configured umask, leading to disclosure of information

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
