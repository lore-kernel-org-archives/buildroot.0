From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 4 Nov 2020 11:12:42 -0600
Subject: [Buildroot] [PATCH 06/10]
 support/testing/tests/core/test_cpeid: new test
In-Reply-To: <20201104145145.1316167-7-thomas.petazzoni@bootlin.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
 <20201104145145.1316167-7-thomas.petazzoni@bootlin.com>
Message-ID: <CANQCQpbsOeoYNQaSST1V7KxxPCXh2Zgz=GPoK3O_6jDNTNxjLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Nov 4, 2020 at 8:54 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> This commit adds a number of test cases to verify that the CPE_ID_*
> variables are properly handled by the generic package infrastructure
> and that the "make show-info" JSON output matches what we expect.
>
> A total of 5 different example packages are used to exercise different
> scenarios of CPE_ID_* variables usage.

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
