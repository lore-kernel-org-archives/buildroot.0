From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 11 Aug 2017 12:19:43 -0300
Subject: [Buildroot] Failing defconfigs due to GCC 6
In-Reply-To: <15ef0875-b514-cb30-02df-d5d413bb0ea9@mind.be>
References: <15ef0875-b514-cb30-02df-d5d413bb0ea9@mind.be>
Message-ID: <CAAEAJfA8ZefJaVg2TJ0=E90w=0N=WHK2F2uDJvS658UQJJZHFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10 August 2017 at 18:01, Arnout Vandecappelle <arnout@mind.be> wrote:
>
> firefly_rk3288_defconfig:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/27873613
>
> firefly_rk3288_demo_defconfig:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/27873615
>

We no longer have firefly boards. We pushed this upstream
because were supposedly gonna keep the hardware from a
project.

In the end, we had to return the boards.

I think we should remove these if nobody can test.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
