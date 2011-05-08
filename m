From: Heiko Zuerker <heiko@zuerker.org>
Date: Sun, 08 May 2011 08:35:41 -0500
Subject: [Buildroot] PATH
In-Reply-To: <201105081523.44670.yann.morin.1998@anciens.enib.fr>
References: <20110508081440.78203647owixiiio@www.home.zuerker.org>
	<201105081523.44670.yann.morin.1998@anciens.enib.fr>
Message-ID: <20110508083541.66044mwno728t7ok@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>:
> Heiko, All,
>
> On Sunday 08 May 2011 15:14:40 Heiko Zuerker wrote:
>> I'm almost done with the MySQL 5.5 script, but it requires ./ in the path.
>> It may not be a bad idea to add this to Makefile.in (TARGET_PATH,
>> HOST_PATH), in case other packages have a similar behavior.
>> Thoughts?
>> (Worst case I'll just keep it in the mysql.mk)
>
> In my opinion, . in the path is a Really Bad Idea (TM), and should not
> only be avoided, but entirely banned.

Just curious, why are you against having . in the path?

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
