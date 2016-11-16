From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 16 Nov 2016 15:14:25 -0800
Subject: [Buildroot] 2016.11-rc2 with really old versions of bash (RHEL5)
In-Reply-To: <582ce22d87e4_b6b11ecfac31990@ultri3.mail>
References: <20161113210740.3a8cedb2@free-electrons.com>
 <582ce22d87e4_b6b11ecfac31990@ultri3.mail>
Message-ID: <CAMo8BfL07+NgrNjvFCC5H-6AzKqLPAqZDwppNDVFb77wT-z-GQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 16, 2016 at 2:48 PM, Ricardo Martincoski
<ricardo.martincoski@gmail.com> wrote:
> Do you see the issue described below? Maybe I am doing something wrong.
> What bash version do you have in your RHEL5 servers?

Yes, I have this issue. It was introduced by the commit 20cd49738781b ("core:
add support for multiple br2-external trees").

-- 
Thanks.
-- Max
