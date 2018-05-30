From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 May 2018 18:15:03 +0200
Subject: [Buildroot] Buildroot 2018.05-rc3 released
In-Reply-To: <20180530180026.77e1dfac@windsurf.home> (Thomas Petazzoni's
 message of "Wed, 30 May 2018 18:00:26 +0200")
References: <87efhvufjm.fsf@dell.be.48ers.dk>
 <1527599917.2053.2.camel@rovoreed.com>
 <87fu2a7bkq.fsf@dell.be.48ers.dk>
 <1527615682.2053.4.camel@rovoreed.com>
 <87po1e5mev.fsf@dell.be.48ers.dk>
 <1527674917.2072.2.camel@rovoreed.com>
 <87tvqp2lqv.fsf@dell.be.48ers.dk>
 <20180530180026.77e1dfac@windsurf.home>
Message-ID: <87efht2k8o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> Ok, interesting. Enabling python3 for the target means that our host
 >> python becomes python3,

 > Yes that is expected.

Yes, but that could conceptually explain why Mike sees a difference in
behaviour.

 >> > The Linux distribution/version I am building on is Fedora Red Hat 25
 >> > ...  
 >> 
 >> > [mike at modron ~]$ uname -a
 >> > Linux modron 4.9.14-200.fc25.x86_64 #1 SMP Mon Mar 13 19:26:40 UTC 2017
 >> > x86_64 x86_64 x86_64 GNU/Linux  
 >> 
 >> Ok, I'm on Debian. Thomas, you are using Fedora now, right? Can you give
 >> ca-certificates a try?

 > It builds fine here: http://code.bulix.org/092xcg-342074?raw

Thanks, just like on my machine and the autobuilders.

Mike, there must be something odd going on with your machine. I'm afraid
you will have to debug it further yourself. Maybe try running
certdata2pem.py manually?

-- 
Bye, Peter Korsgaard
