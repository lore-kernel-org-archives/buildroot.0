From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 17:19:51 +0100
Subject: [Buildroot] [PATCH 1/2] package/libid3tag: fix id3tag.pc
In-Reply-To: <20190215224207.15546-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 15 Feb 2019 23:42:06 +0100")
References: <20190215224207.15546-1-fontaine.fabrice@gmail.com>
Message-ID: <87lg29qfko.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add -lz to id3tag.pc, this fix is needed to be able to use pkg-config in
 > madplay to find id3tag dependencies

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
