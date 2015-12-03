From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Dec 2015 22:18:58 +0100
Subject: [Buildroot] [PATCH 1/4] dhrystone: add a hash file
In-Reply-To: <20151203215235.08f8d18c@gmx.net> (Peter Seiderer's message of
 "Thu, 3 Dec 2015 21:52:35 +0100")
References: <1449059383-62131-1-git-send-email-Vincent.Riera@imgtec.com>
 <87poyofulj.fsf@dell.be.48ers.dk> <56601AD5.1090608@imgtec.com>
 <20151203114424.6f129af3@free-electrons.com>
 <87610fep1h.fsf@dell.be.48ers.dk> <20151203215235.08f8d18c@gmx.net>
Message-ID: <87oae7b58d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

Hi,

 > Hello Peter,

 > Why not append a (short) hash to the saved file for unversioned downloads?

 > e.g. dhry-c-038a7e9

This could be done, but it complicates the primary/backup site handling
(E.G. should they use the upstream name or "our" name) - The way
sources.buildroot.net is kept up to date would mean that they would need
to use "our" name.

-- 
Venlig hilsen,
Peter Korsgaard 
