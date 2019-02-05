From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 15:41:28 +0100
Subject: [Buildroot] [PATCH v6] testing/infra: split runtime test from
 BRTest
In-Reply-To: <f4c84d5e-a554-c1c8-0ead-6fe2d47db8b0@mind.be> (Arnout
 Vandecappelle's message of "Tue, 5 Feb 2019 15:29:06 +0100")
References: <1549358791-19797-1-git-send-email-matthew.weber@rockwellcollins.com>
 <87o97qnzfg.fsf@dell.be.48ers.dk>
 <f4c84d5e-a554-c1c8-0ead-6fe2d47db8b0@mind.be>
Message-ID: <87pns6mh5z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> I agree that RuntimeTestBase is maybe a nicer name, but BRTest for
 >> something where we run a Buildroot output under qemu isn't really bad
 >> either IMHO.

 >  I thought of that as well, but then I thought that it would be confusing to add
 > a superclass. But I hadn't figured out that BRTest would indeed refer to tests
 > doing a full Buildroot build.

 >  BaseTest is not that great, though. BRConfigTest maybe? That more accurately
 > reflects what it does, I think.

Sure, that is fine by me. I would just prefer to leave BRTest to keep
the diff minimal.

-- 
Bye, Peter Korsgaard
