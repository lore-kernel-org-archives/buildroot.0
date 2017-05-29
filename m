From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 23:36:31 +0200
Subject: [Buildroot] [PATCH 1/1] Added notes to the mosh package help to
 clarify run time issues.
In-Reply-To: <CAPJzBTqAjB8mgm9VuKgAGBRwx3WLrWao_pEPokY3Z6SrYn0bPA@mail.gmail.com>
References: <1496082575-24450-1-git-send-email-glbsalazar@gmail.com>
 <20170529223932.2acf7216@free-electrons.com>
 <CAPJzBTrho+CL8vKFHh0NzoQ49RfJEcfzg4ZUNMGi2+f599UxFg@mail.gmail.com>
 <20170529231511.07303b15@free-electrons.com>
 <CAPJzBTqAjB8mgm9VuKgAGBRwx3WLrWao_pEPokY3Z6SrYn0bPA@mail.gmail.com>
Message-ID: <20170529233631.2747e813@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 May 2017 22:30:29 +0100, Gon?alo Salazar wrote:

> Just to ensure that the patch is submitted correctly this time, is this clearer?
> 
> Mosh requires that the remote machine has a locale setting matching
> the one on the client.
> 
>  When using mosh with dropbear on a remote machine, the client needs mosh
>  with a version above 1.3.0 and the --no-ssh-pty option needs to be passed
>  when starting the connection.

Yes, much better!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
