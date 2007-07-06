From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 6 Jul 2007 17:40:04 +0200
Subject: [Buildroot] Eric's offline again.
References: <024c01c7bf54$58e46670$0302a8c0@atmel.com>
	<20070705214243.4eb4ea62@localhost.localdomain>
Message-ID: <013101c7bfe3$f6d7aec0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> Eric set up an account for me at svn.uclibc.org a few months ago, but
>> all my login attempts fail.
>> 
>> I followed the instructions at
>> http://buildroot.uclibc.org/developer.html to generate a public
>> (id_dsa.pub) and a private key (id_dsa), both stored in
>> <homedir>/.ssh. I generated a key without a passphrase, but now when
>> I understand more I would like to have a new key with a passphrase.
> 
> Are you running "ssh-add"? And is your ssh-agent running in the
> background?
> _______________________________________________


Thanks, ssh-agent was running, so the thing missing was ssh-add.
Maybe it is worthwhile to update the http://buildroot.uclibc.org/developer.html
to say that 
* you should add a passphrase when generating the key.
* ssh-agent should run
* ssh-add <homedir>/.ssh/id_dsa

Best Regards
Ulf Samuelsson
