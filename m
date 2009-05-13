From: Cyril HAENEL <chaenel@free.fr>
Date: Wed, 13 May 2009 15:27:15 +0200
Subject: [Buildroot] Obtaining old SVN revision
In-Reply-To: <87eiutry61.fsf@macbook.be.48ers.dk>
References: <4A0AA1D9.1030808@carallon.com>	<87r5ytrzke.fsf@macbook.be.48ers.dk>
	<4A0ABA5D.7040308@free.fr> <87eiutry61.fsf@macbook.be.48ers.dk>
Message-ID: <4A0ACAB3.7070502@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>
> You can see the latest version of your tree using git show (before you
> run git pull to get updates), and the information also gets stored in
> your rootfs (in /etc/br-version).
>
>   
"git show" give me a lot of thing but nothing which seems to be a 
revision number. Or it's the first line ?
commit _61aeb6e484041f4bcc399c3eff2702d5464fb8b3_ ?

Thus if I want in some week to download a fresh buildroot with this 
revision, I do
git clone 61aeb6e484041f4bcc399c3eff2702d5464fb8b3 
http://git.buildroot.net/buildroot
?

-- 

Cyril Haenel
Registered Linux User #332632
