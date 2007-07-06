From: Andrew May <acmay@acmay.homeip.net>
Date: Thu, 5 Jul 2007 21:42:43 -0700
Subject: [Buildroot] Eric's offline again.
In-Reply-To: <024c01c7bf54$58e46670$0302a8c0@atmel.com>
References: <024c01c7bf54$58e46670$0302a8c0@atmel.com>
Message-ID: <20070705214243.4eb4ea62@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 6 Jul 2007 00:31:51 +0200
"Ulf Samuelsson" <ulf@atmel.com> wrote:

> Eric set up an account for me at svn.uclibc.org a few months ago, but
> all my login attempts fail.
> 
> I followed the instructions at
> http://buildroot.uclibc.org/developer.html to generate a public
> (id_dsa.pub) and a private key (id_dsa), both stored in
> <homedir>/.ssh. I generated a key without a passphrase, but now when
> I understand more I would like to have a new key with a passphrase.

Are you running "ssh-add"? And is your ssh-agent running in the
background?
