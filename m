From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 30 May 2018 18:12:37 +0200
Subject: [Buildroot] Buildroot 2018.05-rc3 released
In-Reply-To: <20180530180026.77e1dfac@windsurf.home>
References: <87efhvufjm.fsf@dell.be.48ers.dk>
 <1527599917.2053.2.camel@rovoreed.com> <87fu2a7bkq.fsf@dell.be.48ers.dk>
 <1527615682.2053.4.camel@rovoreed.com> <87po1e5mev.fsf@dell.be.48ers.dk>
 <1527674917.2072.2.camel@rovoreed.com> <87tvqp2lqv.fsf@dell.be.48ers.dk>
 <20180530180026.77e1dfac@windsurf.home>
Message-ID: <6727eaa1-d114-2aff-6f4a-4d52761568be@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 30/05/2018 ? 18:00, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Wed, 30 May 2018 17:42:32 +0200, Peter Korsgaard wrote:
> 
>>  > Yes, sorry, I mean Python3 for the target. I also have ".pyc compiled
>>  > sources only", core python3 modules??--->?[*] unicodedata module, ?core
>>  > python3 modules??--->?(none)?  
>>
>> Ok, interesting. Enabling python3 for the target means that our host
>> python becomes python3,
> 
> Yes that is expected.
> 
>>  > The Linux distribution/version I am building on is Fedora Red Hat 25
>>  > ...  
>>
>>  > [mike at modron ~]$ uname -a
>>  > Linux modron 4.9.14-200.fc25.x86_64 #1 SMP Mon Mar 13 19:26:40 UTC 2017
>>  > x86_64 x86_64 x86_64 GNU/Linux  
>>
>> Ok, I'm on Debian. Thomas, you are using Fedora now, right? Can you give
>> ca-certificates a try?
> 
> It builds fine here: http://code.bulix.org/092xcg-342074?raw

The autobuilder at Smile is using Fedora 28, there is no issue with ca-certificates.

http://autobuild.buildroot.org/?submitter=Romain+Naour+(Smile)&&status=NOK

Romain

> 
> Thomas
> 
