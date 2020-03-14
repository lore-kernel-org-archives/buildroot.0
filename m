From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:23:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/lz4: security bump to version
 1.9.2
In-Reply-To: <20200228232626.2387483-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Feb 2020 00:26:26 +0100")
References: <20200228232626.2387483-1-fontaine.fabrice@gmail.com>
Message-ID: <877dzmvoif.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2019-17543: LZ4 before 1.9.2 has a heap-based buffer overflow
 >   in LZ4_write32 (related to LZ4_compress_destSize), affecting
 >   applications that call LZ4_compress_fast with a large input. (This
 >   issue can also lead to data corruption.) NOTE: the vendor states "only
 >   a few specific / uncommon usages of the API are at risk."
 > - Update indentation of hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
