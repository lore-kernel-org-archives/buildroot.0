From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Date: Wed, 6 Sep 2017 08:09:24 -0300 (BRT)
Subject: [Buildroot] [RFC] testing: add python-cryptography tests
In-Reply-To: <CAGm1_ktR=czPoLUdFpUnp4q2Ve_o=umgVgWOEkKnHdzkLyxvNQ@mail.gmail.com>
References: <20170904071500.3858-1-yegorslists@googlemail.com>
 <59af5dfae6364_331f1091a18551a0@ultri3.mail>
 <CAGm1_ktR=czPoLUdFpUnp4q2Ve_o=umgVgWOEkKnHdzkLyxvNQ@mail.gmail.com>
Message-ID: <920595879.8309642.1504696164017.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wednesday, September 6, 2017 6:44:17 AM, Yegor Yefremov

> On Wed, Sep 6, 2017 at 4:31 AM, Ricardo Martincoski
[snip]
>> But I run your tests using -k, then I entered the qemu using the command in the
>> first line of TestPythonPy2Cryptography-run.log, then I called its Python shell
[snip]
> 
> How can I perform tests for this testing framework locally?

Run this command on the buildroot tree to see all available options:

support/testing/run-tests -h

-k and -s are very useful when creating/changing tests.

Regards,
--
Ricardo Martincoski
DATACOM 
Ethernet Switches 
Rua Am?rica, 1000 - Eldorado do Sul, RS - 92990-000 - Brasil
+55 51 3933 3000 - Ramal 3307
ricardo.martincoski at datacom.ind.br
www.datacom.ind.br
