From: Santhosh Ramani <srcoolz@gmail.com>
Date: Wed, 5 Dec 2012 12:46:19 -0600
Subject: [Buildroot] Qt library difference between E.so and just .so
In-Reply-To: <20121204181948.60bfbd4e@eb-e6520>
References: <CADKZYYJFAKFs5KmSbcU7o=wkWi1_wOVc6MhgZrOdALgr_iva+A@mail.gmail.com>
 <20121204181948.60bfbd4e@eb-e6520>
Message-ID: <CADKZYY+HDpGpJKznaRWBSthrsHhOvxaJtHBr6ou3Gz5RNrxcdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Everyone,

Thank you so much for all your replies, I tried the solution you guys
mentioned and yes it works fine. I now point to the libraries created by
buildroot and also had to point to qmake from buildroot and can run the
applications fine on my board.

How do I get touchscreen to work, the applications load fine, but there is
no touch response. I performed ts_calibrate and it works fine...so I'm
guessing there is again something to do with pointing to the correct tslib??

Thank you again for all your answers and patience :)

Regards

Santhosh


-- 
Greater the Difficulty....Sweeter is the Victory
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121205/f59f8804/attachment.html>
