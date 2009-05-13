From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 13 May 2009 15:41:38 +0200
Subject: [Buildroot] Obtaining old SVN revision
In-Reply-To: <4A0ACAB3.7070502@free.fr> (Cyril HAENEL's message of "Wed\,
	13 May 2009 15\:27\:15 +0200")
References: <4A0AA1D9.1030808@carallon.com>
	<87r5ytrzke.fsf@macbook.be.48ers.dk> <4A0ABA5D.7040308@free.fr>
	<87eiutry61.fsf@macbook.be.48ers.dk> <4A0ACAB3.7070502@free.fr>
Message-ID: <871vqtrugd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cyril" == Cyril HAENEL <chaenel@free.fr> writes:

 Cyril> "git show" give me a lot of thing but nothing which seems to be a
 Cyril> revision number. Or it's the first line ?
 Cyril> commit _61aeb6e484041f4bcc399c3eff2702d5464fb8b3_ ?

Yes. You can get a more readable alias by 'git describe'

 Cyril> Thus if I want in some week to download a fresh buildroot with this
 Cyril> revision, I do

No, just git clone like always, and then git checkout 61aeb6e484041f4b

See the git documentation for details: http://git-scm.com/documentation

-- 
Bye, Peter Korsgaard
