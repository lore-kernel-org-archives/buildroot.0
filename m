From: David Bachelart <david.bachelart@bbright.com>
Date: Thu, 11 Sep 2014 12:13:22 +0200
Subject: [Buildroot] [PATCH 1/1] ipmitool: new package
In-Reply-To: <20140911112614.0996937a@free-electrons.com>
References: <1410421465-9788-1-git-send-email-david.bachelart@bbright.com>
 <20140911112614.0996937a@free-electrons.com>
Message-ID: <CAJeZidJzRhJoyx9ARDDk9vhcF1K7CtZOEvk7R6QCRKLXrJS19g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I submitted a new patch, setting the license field to MIT.

The package builds fine with the last two configurations, but does not
build using the first one. The link step breaks, looking for a _fork
symbol. Since it seems related to the MMU, the second configuration did not
make sense anymore.

David
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140911/2010226b/attachment.html>
