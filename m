From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 5 Dec 2016 15:31:04 +0100
Subject: [Buildroot] [PATCH 1/1] nginx-dav-ext: New package
In-Reply-To: <20161205145353.40c00fc3@free-electrons.com>
References: <1480438071-11906-1-git-send-email-johan.oudinet@gmail.com>
 <20161204235230.4be68e7c@free-electrons.com>
 <CAJtjsKY2yT_EekNg2F_-K-PyLN5Zp47ykhRwVK4Kg3PixY4K9A@mail.gmail.com>
 <20161205121442.51bb6c46@free-electrons.com>
 <CAJtjsKayVVJBRf+v1PYnL1hb6D5FqfqC1Y3pb9fGnkybf3bpAA@mail.gmail.com>
 <20161205143322.227297e2@free-electrons.com>
 <CAJtjsKa_vUgVKHsDajes2ihFZMmj4U-5cwLgwHjEKspf7BrgAg@mail.gmail.com>
 <20161205145353.40c00fc3@free-electrons.com>
Message-ID: <CAJtjsKZdhYNDeCnNR6gaiCCj31c5cWwratqkDJ6C+ieAgcqWrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 5, 2016 at 2:53 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Mon, 5 Dec 2016 14:41:29 +0100, Johan Oudinet wrote:
>
>> Good point. Do you want me to submit a patch series for that, or do
>> you take care of it?
>
> If you can submit a patch series, it would be good :)

Done.
Finally, I make BR2_PACKAGE_NGINX_DAV_EXT depends on
BR2_PACKAGE_NGINX_HTTP_DAV_MODULE as it does not make sense if this
nginx's module is not enabled.

Best regards,
-- 
Johan
