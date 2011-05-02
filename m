From: Heiko Zuerker <heiko@zuerker.org>
Date: Sun, 01 May 2011 20:11:41 -0500
Subject: [Buildroot] mysql server and stack direction
In-Reply-To: <20110501122303.70645rnjm01sb0kk@www.home.zuerker.org>
References: <20110501074808.87796h8v1x8gb3k8@www.home.zuerker.org>
	<87mxj6uz7p.fsf@macbook.be.48ers.dk>
	<20110501122303.70645rnjm01sb0kk@www.home.zuerker.org>
Message-ID: <20110501201141.75345921e89v74g8@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting Heiko Zuerker <heiko@zuerker.org>:
> Hey,
>
> Quoting Peter Korsgaard <jacmet@uclibc.org>:
>>>>>>> "Heiko" == Heiko Zuerker <heiko@zuerker.org> writes:
>>
>> Heiko> Hi,
>> Heiko> I'm working on the MySQL server package (v5.1 done, v5.5 will be
>> Heiko> next), but one of the issues is that it needs the "stack direction"
>> Heiko> set before the compile.

I submitted the current version of the patch, since I'm not sure when  
I'll be able to continue the work.
MySQL 5.1.x works fine for me (client + server), but 5.5 probably  
needs some more experienced folks in the area of cross-compiling.

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
