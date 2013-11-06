From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 6 Nov 2013 21:00:17 +0000
Subject: [Buildroot] [PATCH v3] uclibc: reinstate support for version
	0.9.31
In-Reply-To: <20131106215452.7c38fc1f@skate>
References: <1383767739-762-1-git-send-email-spdawson@gmail.com>
 <20131106215452.7c38fc1f@skate>
Message-ID: <CAHt8ZCMhKVs_W_yUVML0iaCXaexY30MB708=jPHh3XkyO6cSsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, thanks for the feedback.

On 6 November 2013 20:54, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Can we make this depends on BR2_avr32 instead, and generally consider
> 0.9.31 as an avr32 only version?

Yes, good idea.

> Also, I believe if the other uClibc versions do not work for AVR32,
> then we should add the corresponding 'depends on !BR2_avr32'.

Okay; I'll rework the patch.

Simon.
