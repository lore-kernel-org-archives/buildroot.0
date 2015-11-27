From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Nov 2015 19:29:24 +0100
Subject: [Buildroot] [PATCH] mongrel2: disable polarssl assembly as we
	do in the polarssl package
In-Reply-To: <1448632468-45374-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Fri, 27 Nov 2015 13:54:28 +0000")
References: <1448632468-45374-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87poyvqosb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > mongrel2 bundles polarssl so it has the same problem as the polarssl
 > with the assembly optimization, so let's use the same solution here.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
