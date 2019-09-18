From: Matthew Weber <matthew.weber@collins.com>
Date: Tue, 17 Sep 2019 20:36:08 -0500
Subject: [Buildroot] [External] Re: buildroot | Pipeline #82303484 has
 failed for master | 7af21c70
In-Reply-To: <463e01cd-5bd5-5c58-8245-296c7d16a789@mind.be>
References: <5d7ea4c3e52b4_7ec83f8ed04e16e8332034b@sidekiq-asap-05-sv-gprd.mail>
 <463e01cd-5bd5-5c58-8245-296c7d16a789@mind.be>
Message-ID: <CANQCQpYj-Pb3s4_wYy=Mt+pYPAVstOPKTFW5WxSNYHSw+RZKFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,


On Tue, Sep 17, 2019 at 4:54 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi Matt,
>
> On 15/09/2019 22:53, GitLab wrote:
> > GitLab
> > ?     Your pipeline has failed.
> [snip]
> > Pipeline #82303484
> > <https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_buildroot.org_buildroot_pipelines_82303484&d=DwIDaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=bXGG0ngCSTKDOWEbAby3nS7YBF-aJpZyRAvN294TTBc&s=kL0LpUM9n1t3CH1Bits2sGhpIuqMNAbCY4_e09KQKoI&e= > triggered by
> > arnout <https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_arnout&d=DwIDaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=bXGG0ngCSTKDOWEbAby3nS7YBF-aJpZyRAvN294TTBc&s=yV_wM4H7yNub7ChAywkyDDWeEaOAGD8z6WM1HgA2AVU&e= >
> >
> > had 1 failed build.
> > Logs may contain sensitive data. Please consider before forwarding this email.
> > ?     test
> >
> >       check-package <https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_buildroot.org_buildroot_-2D_jobs_295683825&d=DwIDaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=bXGG0ngCSTKDOWEbAby3nS7YBF-aJpZyRAvN294TTBc&s=d8lJBMOaAzz63JYf6fnkl9JSVaza7HWnZqDs8HfbzYU&e= >
> >
> > 0 warnings generated
> > 34369 lines processed
> > 1 warnings generated
> > package/bc/bc.mk:8: remove default value of _SOURCE variable
> > (https://urldefense.proofpoint.com/v2/url?u=http-3A__nightly.buildroot.org_-23generic-2Dpackage-2Dreference&d=DwIDaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=bXGG0ngCSTKDOWEbAby3nS7YBF-aJpZyRAvN294TTBc&s=Q4qCqbjqCIMsTLdfHtAuTd5r9_wzuiMeaQ04sdUczIE&e= )
>
>  Could you fix this check-package warning?
>

Oops, here's a fix
http://patchwork.ozlabs.org/patch/1163655/
