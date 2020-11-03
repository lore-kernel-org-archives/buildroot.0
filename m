From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Nov 2020 08:54:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/fastd: fix CVE-2020-27638
In-Reply-To: <20201031163420.289481-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 31 Oct 2020 17:34:20 +0100")
References: <20201031163420.289481-1-fontaine.fabrice@gmail.com>
Message-ID: <871rhaan9m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > receive.c in fastd before v21 allows denial of service (assertion
 > failure) when receiving packets with an invalid type code.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
