From: Marcos <marcosr@cointech.com.ar>
Date: Tue, 20 Oct 2009 15:03:56 -0300
Subject: [Buildroot] =?windows-1251?q?Phonon_don=92t=92_work_in_Target_Pla?=
	=?windows-1251?q?tform_with_gstreamer_backend=2E?=
Message-ID: <5007ECC9311241DDB738B95F5B4D1579@developer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Problem: 
??????????? ??Phonon don?t? work in Target Platform with gstreamer backend. 
Data:
???????? Develop Platform. 
- Linux Ubuntu 9.04
- Qt Embedded 4.5.2
- Buildroot 2009-08
- Cross-Compiler ( uClibc 9.30.1, binutils 2.19.1, gcc 4.3.4)

Target Platform. 
- Microcontroller AT91SAM9263B ?ARM926 ? Evaluation Board Atmel
AT91SAM9263-EK
- Kernel 2.6.27.
- RootFile generated for Builroot.

Error Message in the target when run one applications that use Phonon with
GStreamer. 
??????? 
can't resolve symbol 'parse_sami' 
Phonon::GStreamer::Backend: Failed to initialize GStreamer

(<unknown>:442): GStreamer-CRITICAL **: gst_object_ref: assertion `object !=
NUL???????? 

(<unknown>:442): GStreamer-CRITICAL **: gst_object_sink: assertion
`GST_IS_OBJEC???????????? 
# ls9r?I??????? 
LiTE??? 

(<unknown>:442): GStreamer-CRITICAL **: gst_object_sink: assertion
`GST_IS_OBJEC
T (object)' failed

(<unknown>:442): GStreamer-CRITICAL **: gst_object_ref: assertion `object !=
NUL
L' failed

(<unknown>:442): GStreamer-CRITICAL **: gst_object_sinkt: assertion
`G_IS_OBJECT
?(object)' failed

(<unknown>:442): GStreamer-CRITICAL **: gst_object_ref: assertion `object !=
NUL
L' failed

(<unknown>:442): GStreamer-CRITICAL **: gst_object_sink: assertion
`GST_IS_OBJEC
T (object)' failed

(<unknown>:442): GStreamer-CRITICAL **: gst_element_set_state: assertion
`GST_IS
_ELEMENT (element)' failed
WARNING: Phonon::createPath: Cannot connect? Phonon::MediaObject ( no
objectName
?) to? Phonon::AudioOutput ( no objectName ).
WARNING: Phonon::createPath: Cannot connect? Phonon::MediaObject ( no
objectName
?) to? Phonon::VideoWidget ( no objectName ).


Best regards. Marcos Rodriguez.


___________________________________________________
- Descargo de responsabilidad del correo de Internet
La informacion transmitida en este correo incluyendo sus adjuntos, es para uso exclusivo de la entidad o persona destinataria y puede contener informacion privilegiada y confidencial. Se prohibe retener, editar, retransmitir, difundir, u cualquier otro uso de esta informacion por personas o entidades que no sean los destinatarios previstos. Si usted recibio este mensaje por error, por favor avise al remitente y elimine permanentemente esta informacion de su computador.
COIN TECH S.A. no acepta la responsabilidad por cualquier error, omision, corrupcion o virus en el contenido de este mensaje o sus adjuntos que resulten de la transmision del mismo.

- Internet E-mail Disclaimer
The information transmitted in this e-mail including attachments, is intended only for the person or entity to which it is addressed, and may contain confidential and privileged information. Any retention, review, retransmission, dissemination, or other uses of this information by persons or entities other than the intended recipient is prohibited. If you receive this in error, please contact the sender and delete this message from your computer.
COIN TECH S.A. does not accept liability for any errors, omissions, corruption or virus in the contents of this message or any attachments that arise as a result of e-mail transmission.
