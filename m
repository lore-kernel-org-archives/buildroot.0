From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:14:22 +0100
Subject: [Buildroot] [PATCH 4/5] package/patch: fix CVE-2019-13636
In-Reply-To: <20200303194703.242362-4-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 3 Mar 2020 20:47:02 +0100")
References: <20200303194703.242362-1-fontaine.fabrice@gmail.com>
 <20200303194703.242362-4-fontaine.fabrice@gmail.com>
Message-ID: <87eetuncw1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > In GNU patch through 2.7.6, the following of symlinks is mishandled in
 > certain cases other than input files. This affects inp.c and util.c.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
