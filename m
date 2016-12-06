From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Date: Tue, 6 Dec 2016 17:30:06 -0200 (BRST)
Subject: [Buildroot] [RFC v2 4/4] support/download/git: shallow fetch of
 all branches
In-Reply-To: <CA+fik51+qcpnLCT9RuEvyGKf5Yf5-XNz5KLv3G-vfnE485unEg@mail.gmail.com>
References: <20161202152123.20399-1-ricardo.martincoski@datacom.ind.br>
 <20161202152123.20399-5-ricardo.martincoski@datacom.ind.br>
 <CA+fik51+qcpnLCT9RuEvyGKf5Yf5-XNz5KLv3G-vfnE485unEg@mail.gmail.com>
Message-ID: <1029334462.1039759.1481052606310.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brandon,

Thank you for your tests.

On December 6, 2016 3:13:08 PM, Brandon Maier wrote:
>> As a middle ground between a --depth 1 fetch and a full clone, fetch all 
>> branches with depth of 100. We have a good change to catch the desired 
>
>Should this be "good chance"? 

Yes.


>Also, is there any particular reason for depth 100? 

No particular reason. It was only a guess.


>> ... 
>> + # As a middle ground between a --depth 1 fetch and a full fetch, fetch all 
>> + # branches with depth of 100. We have a good change to catch the desired 
>
> Again, "good chance"? 

Yes.


> Altogether good idea Ricardio, I like the "--depth 100" feature. This will be helpful for our team as well.

Actually it was not my idea, Arnout suggested the feature at
http://patchwork.ozlabs.org/patch/690098/


Regards,
Ricardo Martincoski
