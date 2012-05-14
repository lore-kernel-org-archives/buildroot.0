From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 May 2012 17:56:31 -0300
Subject: [Buildroot] [PATCH 1/2] libtorrent: new package
In-Reply-To: <87wr4ey07u.fsf@macbook.be.48ers.dk>
References: <1336765188-20743-1-git-send-email-gustavo@zacarias.com.ar>
 <4FADA2BA.3010507@mind.be>
 <d72c000db80dab016beb8feec3f3a870@zacarias.com.ar>
 <4FAE710C.4020706@mind.be> <87wr4ey07u.fsf@macbook.be.48ers.dk>
Message-ID: <1e21a42ccd4362eb749fef94dfe3b30a@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-05-14 17:30, Peter Korsgaard wrote:

> Still, I would prefer if we do it correctly, E.G. make openssl 
> optional
> in libtorrent, and select it by rtorrent.

Ok, i dunno who will use libtorrent on his own (specially since it was 
never added to BR) though.
Sent V3 set (on V2 i forgot to remove the select from libtorrent).
Regards.
