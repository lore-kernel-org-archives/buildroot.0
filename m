From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 May 2020 22:19:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 version 3.2.4
In-Reply-To: <20200522201041.962767-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 22 May 2020 22:10:41 +0200")
References: <20200522201041.962767-1-fontaine.fabrice@gmail.com>
Message-ID: <87tv03ix7z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2020-13164: In Wireshark 3.2.0 to 3.2.3, 3.0.0 to 3.0.10, and
 > 2.6.0 to 2.6.16, the NFS dissector could crash. This was addressed in
 > epan/dissectors/packet-nfs.c by preventing excessive recursion, such as
 > for a cycle in the directory graph on a filesystem.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
