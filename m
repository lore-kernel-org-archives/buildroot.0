From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jan 2012 09:59:53 -0300
Subject: [Buildroot] [PATCH v3] New package: linux-firmware
In-Reply-To: <871uqm4o4r.fsf@macbook.be.48ers.dk>
References: <1327577414-11374-1-git-send-email-yegorslists@googlemail.com>
 <ad47d31d76e74e891bacdf8b9470a643@zacarias.com.ar>
 <8762fy4otk.fsf@macbook.be.48ers.dk>
 <7bd9330dcb162b6faa6e36e3e73f6b1e@zacarias.com.ar>
 <871uqm4o4r.fsf@macbook.be.48ers.dk>
Message-ID: <66c6a1528fa93fdb2c0ff2aa7995db35@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-01-26 09:57, Peter Korsgaard wrote:

>  Gustavo> While at it, should we go for a /lib/firmware skeleton?
>
> What is the advantage to adding an empty dir in the default skeleton? 
> We
> want this work with custom skeletons where it might not exist.

Then $(INSTALL) -D should do it :)
Regards.
