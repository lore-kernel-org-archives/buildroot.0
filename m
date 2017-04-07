From: Jack Breese <jack@kumunetworks.com>
Date: Thu, 6 Apr 2017 17:44:30 -0700
Subject: [Buildroot] [PATCH 1/1] gnupg: Add options for SHA-256 and
 SHA-512 hashes
In-Reply-To: <20170406040121.5ptco5esekcyrxlu@tarshish>
References: <20170406010908.95234-1-jack@kumunetworks.com>
 <20170406040121.5ptco5esekcyrxlu@tarshish>
Message-ID: <CAEojsBh+Rxqn6AEavXaneVEYQd+TqYANHTn6-r8Qn_AX=ard4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>
> What is the size impact of these options? In case the size increase is
> relatively small just enable them unconditionally. I'd say that, given the
> security implications, we should enable SHA2 even if the size impact is
> big.
>
> Size impact is ~6k to the binary to enable both options. (armv7l). I'll
submit v2 with both enabled.

Binary size without SHA256 + SHA512:
-rwxr-xr-x 1 root root 550K Apr  6 10:03 gpg

Binary size with both:
-rwxr-xr-x 1 root root 555.9K Mar 31 22:50 gpg
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170406/8ba83f8b/attachment.html>
