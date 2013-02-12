From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Tue, 12 Feb 2013 12:57:10 +0200
Subject: [Buildroot] [PATCH 1/1] openpgm: new package
In-Reply-To: <20130212115305.3c4b6990@skate>
References: <1360666051-16475-1-git-send-email-alexander.lukichev@gmail.com>
 <1360666051-16475-2-git-send-email-alexander.lukichev@gmail.com>
 <20130212115305.3c4b6990@skate>
Message-ID: <511A2006.90203@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Thomas!

On 02/12/2013 12:53 PM, Thomas Petazzoni wrote:
> The only thing missing I believe is a
> description + Signed-off-by line in the
> package/openpgm/openpgm-cross-compile.patch file.

Oops! I intended to do so but it fell out of my head. Will be fixed.

> Also, did you test this package against uClibc or glibc?
uClibc 0.9.33 only with largefile, threads and all the friends. I guess, threads are mandatory for this library. I'll set the correct dependencies and test with different base libs. Thanks.

--
Best regards,
  Alexander Lukichev
