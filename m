From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 19:30:59 +0100
Subject: [Buildroot] Newbie: git send-email Fails: 5.7.3 Authentication
 unsuccessful
In-Reply-To: <54A586B0.80100@slac.stanford.edu>
References: <54A586B0.80100@slac.stanford.edu>
Message-ID: <20150101193059.7f3a8713@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ernest L Williams,

On Thu, 1 Jan 2015 09:41:04 -0800, Ernest L Williams wrote:
> Hi,
> 
> I am having trouble getting the git-email to work.
> Any ideas why Authentication fails?
> 
> ====== My configuration =========================
> git config --global sendemail.smtpuser ernesto at slac.stanford.edu
> git config --global sendemail.smtpserver email.slac.stanford.edu
> git config --global sendemail.smtpencryption tls
> git config --global sendemail.smtpserverport 587

Did you specify your password in sendemail.smtppass ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
