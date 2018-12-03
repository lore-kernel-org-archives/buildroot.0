From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Dec 2018 22:53:53 +0100
Subject: [Buildroot] [PATCH 1/1] popt: add libiconv to popt.pc.in
In-Reply-To: <20181122194212.5967-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 22 Nov 2018 20:42:12 +0100")
References: <20181122194212.5967-1-fontaine.fabrice@gmail.com>
Message-ID: <87a7lm46q6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add ${LTLIBICONV} to popt.pc.in so applications such as shairport-sync
 > will know that they must link with -liconv when building statically

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c5b0d1d2867e49c022a2ad971dd9f358ff0f3865

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
