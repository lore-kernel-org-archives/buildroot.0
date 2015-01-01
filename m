From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Jan 2015 19:46:05 +0100
Subject: [Buildroot] Newbie: git send-email Fails: 5.7.3 Authentication
 unsuccessful
In-Reply-To: <20150101193059.7f3a8713@free-electrons.com>
References: <54A586B0.80100@slac.stanford.edu>
 <20150101193059.7f3a8713@free-electrons.com>
Message-ID: <20150101184605.GI4360@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-01-01 19:30 +0100, Thomas Petazzoni spake thusly:
> On Thu, 1 Jan 2015 09:41:04 -0800, Ernest L Williams wrote:
> > Hi,
> > 
> > I am having trouble getting the git-email to work.
> > Any ideas why Authentication fails?
> > 
> > ====== My configuration =========================
> > git config --global sendemail.smtpuser ernesto at slac.stanford.edu
> > git config --global sendemail.smtpserver email.slac.stanford.edu
> > git config --global sendemail.smtpencryption tls
> > git config --global sendemail.smtpserverport 587
> 
> Did you specify your password in sendemail.smtppass ?

That's not required. I did not, and git is prompting me everytime it
needs to send a mail.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
