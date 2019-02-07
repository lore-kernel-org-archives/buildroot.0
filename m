From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Feb 2019 23:55:24 +0100
Subject: [Buildroot] git tarball hashes [was: Report of Buildroot developer
 meeting FOSDEM 2019]
In-Reply-To: <bc55cb82-c939-78c9-30ee-8c02c39fe425@mind.be>
References: <bc55cb82-c939-78c9-30ee-8c02c39fe425@mind.be>
Message-ID: <78472b2d-4adc-b110-273e-ddce78316dc2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 07/02/2019 23:51, Arnout Vandecappelle wrote:
> making sure the git backend
> produces reproducible tarballs by using the pax archive format (Yann started
> working on an implementation for that)

?I realized while writing this: how does this approach fix the instability of
gzip? Or do we assume that that was a one-off?


?Regards,
?Arnout
