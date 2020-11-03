From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Nov 2020 10:27:33 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-11-02
In-Reply-To: <49-5fa11a00-1-271de3c0@117826441> (Michael Nosthoff via
 buildroot's message of "Tue, 03 Nov 2020 09:51:05 +0100")
References: <49-5fa11a00-1-271de3c0@117826441>
Message-ID: <87sg9q94e2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Nosthoff via buildroot <buildroot@busybox.net> writes:

 > Hi Peter,
 > from time to time I get this build failure reported:

 > On Tuesday, November 03, 2020 09:10 CET, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote: 
 >> 
 >> Results for the '2020.02.x' branch
 >> ----------------------------------
 >> 
 >> Build failures related to your packages:
 >> 
 >> arch | reason | url
 >> -------------+--------------------------------+---------------------------------------------------------------------------------
 >> or1k | host-grpc-1.25.0 |
 >> http://autobuild.buildroot.net/results/605a7e9911fac8785272d0ffdabdde9c8876daa5
 >> 

 > this was fixed by this commit:

 > https://patchwork.ozlabs.org/project/buildroot/patch/20200915161107.1826-1-buildroot at heine.tech/ 

 > Would it make sense to pick this for LTS?

I think so - Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
