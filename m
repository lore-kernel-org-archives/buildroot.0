From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Dec 2019 22:26:26 +0100
Subject: [Buildroot] [PATCH 2/2] package/nss-mdns: disable tests
In-Reply-To: <20191202202006.1805774-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 2 Dec 2019 21:20:06 +0100")
References: <20191202202006.1805774-1-fontaine.fabrice@gmail.com>
 <20191202202006.1805774-2-fontaine.fabrice@gmail.com>
Message-ID: <87y2vupgfx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable tests that depend on check and have been added in version 0.11
 > with
 > https://github.com/lathiat/nss-mdns/commit/7b649a32836af3578a2bb60aa713588f0d9f9a83

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This could have been merged with the 0.14.1 bump commit, but oh well -
Committed, thanks.

-- 
Bye, Peter Korsgaard
