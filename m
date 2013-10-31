From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 31 Oct 2013 21:38:19 +0100
Subject: [Buildroot] iconv: additional encodings
In-Reply-To: <CABMiYf_=RK0UJyZLNkW5JU3xSXKMcNxL9-VRxjNpFqtZ3ye50g@mail.gmail.com>
References: <52725222.9050503@gmail.com>
 <CABMiYf_=RK0UJyZLNkW5JU3xSXKMcNxL9-VRxjNpFqtZ3ye50g@mail.gmail.com>
Message-ID: <0e99777a-09bf-4414-9769-cbfdd10aa040@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan,

Jan Pohanka <xhpohanka@gmail.com> wrote:
>I will answer myself: GCONV_PATH variable is the solution. It must
>point into /usr/lib/gconv!

If you are talking about the host /usr then I think this is not correct. Buildroot should not depend on such files from the host.

Can you find the right files inside output/host ? The files coming from the external toolchain are in output/host/opt.

Best regards,
Thomas
