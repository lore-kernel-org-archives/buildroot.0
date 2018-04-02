From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Apr 2018 17:47:30 +0200
Subject: [Buildroot] [PATCH 7/8] download: add missing '-d' option
In-Reply-To: <20180402145802.17611-7-maxime.hadjinlian@gmail.com> (Maxime
 Hadjinlian's message of "Mon, 2 Apr 2018 16:58:01 +0200")
References: <20180402145802.17611-1-maxime.hadjinlian@gmail.com>
 <20180402145802.17611-7-maxime.hadjinlian@gmail.com>
Message-ID: <87k1tpliel.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > The infrastructure needs to give the 'dl_dir' to the dl-wrappe which in
 > its turn needs to give it to the helper.
 > It will only be used by the 'git' helper as of now.

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

You could argue that the dl-wrapper could itself figure this out
(E.G. the directory part of output) and pass it to the helper, but OK -
We already pass a lot of arguments.

Committed, thanks.

-- 
Bye, Peter Korsgaard
