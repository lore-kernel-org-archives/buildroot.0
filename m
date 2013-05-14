From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 14 May 2013 10:51:24 +0100
Subject: [Buildroot] [PATCH v2] Add support for plain URL in
	$(PKG)_PATCH variable
In-Reply-To: <20130513205954.GB29762@free.fr>
References: <517A1C3D.1010009@mind.be>
 <1368460312-9566-1-git-send-email-jezz@sysmic.org>
 <20130513205954.GB29762@free.fr>
Message-ID: <CAG2jQ8iBw3ybYjH2YYfexkc2LLprw1CVkVK5MrPN0TeiGT1+Gw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13 May 2013 21:59, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> J?r?me, All,
>
> On 2013-05-13 17:51 +0200, J?r?me Pouiller spake thusly:
>> Until now, $(PKG)_PATCH allow only to download patches from same URL than tarball.
>> This patch allow to detect when plain URL are used in $(PKG)_PATCH and correctly
>> handle them.
>>
>> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>

The patch looks good to me.

Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>

--
Regards,
Markos Chandras
