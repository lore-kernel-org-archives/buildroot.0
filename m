From: Qais Yousef <qais.yousef@arm.com>
Date: Sat, 3 Oct 2020 21:58:01 +0100
Subject: [Buildroot] [RFC PATCH 4/4] clang: Fix undefined reference to
 dladdr error
In-Reply-To: <9384100b-8c1d-9982-cd27-b2f6ed03dddf@gmail.com>
References: <20200929102618.28571-1-qais.yousef@arm.com>
 <20200929102618.28571-5-qais.yousef@arm.com>
 <9384100b-8c1d-9982-cd27-b2f6ed03dddf@gmail.com>
Message-ID: <20201003205801.dgxdehckx2uun3yk@e107158-lin.cambridge.arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/29/20 22:59, Romain Naour wrote:
> Hi Qais,
> 
> Le 29/09/2020 ? 12:26, Qais Yousef a ?crit?:
> > For some reason the cmake::find_library() can't detect the path to dl,
> > so we end up not including the right library when linking, hence the
> > error above.
> > 
> > Could be a hack/workaround to the real problem.
> 
> I'm not sure about this patch. Can you describe how to reproduce the issue?

It just complained about not finding the library. Hit the same issue when
building Jugurtha BCC patch. Maybe something wrong in my environment.

Will try to reproduce and copy the full error message.

Thanks!

--
Qais Yousef
