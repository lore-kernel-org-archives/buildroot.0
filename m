From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 10 Mar 2017 16:49:58 -0300 (BRT)
Subject: [Buildroot] Random Reboot
In-Reply-To: <CA+12NBKuFqzLCVxGBudWjoJMYPd1O4GtLC4npxNBONrZpigELA@mail.gmail.com>
References: <CA+12NBKuFqzLCVxGBudWjoJMYPd1O4GtLC4npxNBONrZpigELA@mail.gmail.com>
Message-ID: <858211986.14139602.1489175398417.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Linux User" <newhorizons009@gmail.com>
> To: buildroot at busybox.net
> Sent: Friday, March 10, 2017 4:07:54 PM
> Subject: [Buildroot] Random Reboot

> Hello All,

> I am using a buildroot based environment, running embedded linux 3.10-ltsi.

> I am seeing my target reboot once every few days. Are there any tools that I can
> use to catch the reason of my random reboot ?

If your system saves logs on persistent storage you can search for error messages there. Otherwise you can configure it to use remote logging and collect the logs in a PC.

Keep in mind also that embedded systems usually have small storage capacity and logs can easily exhaust the available space. You must enable some log rotation mechanism if you want to keep it running for long periods.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
