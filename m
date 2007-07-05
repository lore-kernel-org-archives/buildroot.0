From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 6 Jul 2007 00:31:51 +0200
Subject: [Buildroot] Eric's offline again.
Message-ID: <024c01c7bf54$58e46670$0302a8c0@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric set up an account for me at svn.uclibc.org a few months ago, but all my login attempts fail.

I followed the instructions at http://buildroot.uclibc.org/developer.html to generate
a public (id_dsa.pub) and a private key (id_dsa), both stored in <homedir>/.ssh.
I generated a key without a passphrase, but now when I understand more
I would like to have a new key with a passphrase.

Eric said that he made the account to only rely on id_dsa.pub without a password, 
but when I log in:

$ svn list svn+ssh://ulf at svn.uclibc.org/svn/trunk/buildroot

I am asked for a password and I am stuck.

Eric told me the last time that he was busy, and I have not seen any
replies on my sporadic cries for help from him.
=====================
Should I know the password? Is there a default, or is it part of the key or what?

I would like to know if there is something I should be doing different to be able to log in?

Is there anyone except Eric that can set up the account?

Best Regards
Ulf Samuelsson
