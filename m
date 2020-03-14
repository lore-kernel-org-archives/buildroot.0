From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 19:37:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/blktrace: fix CVE-2018-10689
In-Reply-To: <20200301174529.177724-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 1 Mar 2020 18:45:29 +0100")
References: <20200301174529.177724-1-fontaine.fabrice@gmail.com>
Message-ID: <87bloyrddq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > blktrace (aka Block IO Tracing) 1.2.0, as used with the Linux kernel and
 > Android, has a buffer overflow in the dev_map_read function in
 > btt/devmap.c because the device and devno arrays are too small, as
 > demonstrated by an invalid free when using the btt program with a
 > crafted file.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
